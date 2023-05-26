<?php

namespace App\Http\Controllers;

use App\Models\PurchaseHeader;
use App\Http\Requests\StorePurchaseHeaderRequest;
use App\Http\Requests\UpdatePurchaseHeaderRequest;
use App\Models\PurchaseHeaderLine;
use App\Models\Stock;
use App\Models\StockHistory;
use Exception;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PurchaseHeaderController extends Controller
{
    public function index()
    {
        try {
            $data = DB::table('purchase_headers')->select()->get();

            $data = (['data' => $data]);

            return response()->json([
                'result' => $data,
                'message' => 'Succeed'
            ], JsonResponse::HTTP_OK);
        } catch (Exception $e) {

            return response()->json([
                'result' => [],
                'message' => $e->getMessage()
            ], JsonResponse::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    public function create()
    {
    }

    public function store(StorePurchaseHeaderRequest $request)
    {
        try {
            $request->validate([
                'purchase_date' => 'required',
                's_id' => 'required',
                'gross_amount' => 'required',
                'net_amount' => 'required',
            ]);

            $data = PurchaseHeader::create($request->all());

            return response()->json([
                'result' => $data,
                'message' => 'Succeed'
            ], JsonResponse::HTTP_OK);
        } catch (Exception $e) {
            return response()->json([
                'result' => [],
                'message' => $e->getMessage()
            ], JsonResponse::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    public function show($id)
    {
        try {
            $data = DB::table('purchase_headers as ph')->select(['ph.*', 's.name as s_name'])
                ->leftJoin("suppliers as s", "s.id", "=", "ph.s_id")->where("ph.id", "=", $id)->get()->first();

            return response()->json([
                'result' => $data,
                'message' => 'Succeed'
            ], JsonResponse::HTTP_OK);
        } catch (Exception $e) {
            return response()->json([
                'result' => [],
                'message' => $e->getMessage()
            ], JsonResponse::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    public function edit(PurchaseHeader $purchaseHeader)
    {
    }

    public function update(UpdatePurchaseHeaderRequest $request, $id)
    {
        try {
            $request->validate([
                'purchase_date' => 'required',
                's_id' => 'required',
                'gross_amount' => 'required',
                'net_amount' => 'required',
            ]);

            $data = PurchaseHeader::findOrFail($id);
            $data->update($request->all());
        } catch (Exception $e) {
            return response()->json([
                'result' => [],
                'message' => $e->getMessage()
            ], JsonResponse::HTTP_INTERNAL_SERVER_ERROR);
        }

        return response()->json([
            'result' => $data,
            'message' => 'Succeed'
        ], JsonResponse::HTTP_OK);
    }

    public function destroy($id)
    {
        try {
            $data = PurchaseHeader::findOrFail($id)->delete();
        } catch (Exception $e) {
            return response()->json([
                'result' => [],
                'message' => $e->getMessage()
            ], JsonResponse::HTTP_INTERNAL_SERVER_ERROR);
        }

        return response()->json([
            'result' => $data,
            'message' => 'Succeed'
        ], JsonResponse::HTTP_OK);
    }

    public function indexByParam(Request $request)
    {
        try {
            $data = DB::table('purchase_headers as ph')->select(['ph.*', 's.name as s_name'])
                ->leftJoin("suppliers as s", "s.id", "=", "ph.s_id");

            $startDate = $request->start_date;
            $endDate = $request->end_date;
            if ($startDate != null && $startDate != "" && $endDate != null && $endDate != "") {
                $data = $data->whereDate("purchase_date", ">=", $startDate);
                $data = $data->whereDate("purchase_date", "<=", $endDate);
            }

            $rowPerPage = $request->row_per_page;
            if ($rowPerPage == null) {
                $rowPerPage = 10;
                $data = $data->paginate($rowPerPage);
            } else if ($rowPerPage == "0") {
                $data = $data->get();
                $data = (['data' => $data]);
            } else {
                $data = $data->paginate($rowPerPage);
            }

            return response()->json([
                'result' => $data,
                'message' => 'Succeed'
            ], JsonResponse::HTTP_OK);
        } catch (Exception $e) {

            return response()->json([
                'result' => [],
                'message' => $e->getMessage()
            ], JsonResponse::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    public function storeHeaderAndLine(StorePurchaseHeaderRequest $request)
    {
        $response = DB::transaction(function () use ($request) {
            try {
                $request->validate([
                    'purchase_date' => 'required',
                    's_id' => 'required',
                    'gross_amount' => 'required',
                    'net_amount' => 'required',
                    'data' => 'required',
                ]);

                $header = [
                    "purchase_date" => $request->purchase_date,
                    "s_id" => $request->s_id,
                    "gross_amount" => $request->gross_amount,
                    "net_amount" => $request->net_amount,
                    "note" => $request->note
                ];
                $headerResponse = PurchaseHeader::create($header);
                $phId = $headerResponse->id;

                foreach ($request->data as $value) {
                    $model = new PurchaseHeaderLine();
                    $model->ph_id = $phId;
                    $model->line_no = $value['line_no'];
                    $model->i_id = $value['i_id'];
                    $model->qty = $value['qty'];
                    $model->unit_price = $value['unit_price'];
                    $model->net_amount = $value['net_amount'];
                    $model->note = $value['note'];
                    $model->save();

                    $currentStock = Stock::findOrFail($value['i_id']);
                    $currentStock->update(array(
                        'actual_qty' => $currentStock->actual_qty + $value['qty'],
                        'total_qty' => $currentStock->total_qty + $value['qty']
                    ));

                    $historyStock = new StockHistory();
                    $historyStock->i_id = $value['i_id'];
                    $historyStock->h_id = $phId;
                    $historyStock->transaction_type = 1;
                    $historyStock->total_qty = $value['qty'];
                    $historyStock->current_qty = $value['qty'];
                    $historyStock->item_price = $value['unit_price'];
                    $historyStock->save();
                }

                return response()->json([
                    'result' => $headerResponse,
                    'message' => 'Succeed'
                ], JsonResponse::HTTP_OK);
            } catch (\Throwable $th) {
                DB::rollBack();
                return response()->json([
                    'result' => [],
                    'message' => $th->getMessage()
                ], JsonResponse::HTTP_INTERNAL_SERVER_ERROR);
            }
        });

        return $response;

        // try {

        //     $request->validate([
        //         'purchase_date' => 'required',
        //         's_id' => 'required',
        //         'gross_amount' => 'required',
        //         'net_amount' => 'required',
        //         'note' => 'required',
        //         'data' => 'required',
        //     ]);

        //     // $header = new PurchaseHeader;
        //     // $header->purchase_date = $request->purchase_date;
        //     // $header->s_id = $request->s_id;
        //     // $header->gross_amount = $request->gross_amount;
        //     // $header->net_amount = $request->net_amount;
        //     // $header->note = $request->note;
        //     // $headerResponse = $header->save();

        //     $header = [
        //         "purchase_date" => $request->purchase_date,
        //         "s_id" => $request->s_id,
        //         "gross_amount" => $request->gross_amount,
        //         "net_amount" => $request->net_amount,
        //         "note" => $request->note
        //     ];
        //     $headerResponse = PurchaseHeader::create($header);
        //     $phId = $headerResponse->id;
        //     DB::commit();

        //     foreach ($request->data as $key => $value) {
        //         $model = new PurchaseHeaderLine();
        //         $model->ph_id = $phId;
        //         $model->i_id = $value['i_id'];
        //         $model->qty = $value['qty'];
        //         $model->unit_price = $value['unit_price'];
        //         $model->net_amount = $value['net_amount'];
        //         $model->note = $value['note'];
        //         $model->save();
        //     }

        //     return response()->json([
        //         'result' => $headerResponse,
        //         'message' => 'Succeed'
        //     ], JsonResponse::HTTP_OK);
        // } catch (Exception $e) {
        // return response()->json([
        //     'result' => [],
        //     'message' => $e->getMessage()
        // ], JsonResponse::HTTP_INTERNAL_SERVER_ERROR);
        // }
    }
}
