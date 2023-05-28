<?php

namespace App\Http\Controllers;

use App\Models\SalesHeader;
use App\Http\Requests\StoreSalesHeaderRequest;
use App\Http\Requests\UpdateSalesHeaderRequest;
use App\Models\SalesHeaderLine;
use App\Models\Stock;
use App\Models\StockHistory;
use Exception;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SalesHeaderController extends Controller
{
    public function index()
    {
        try {
            $data = DB::table('sales_headers')->select()->get();

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

    public function store(StoreSalesHeaderRequest $request)
    {
        try {
            $request->validate([
                'transaction_date' => 'required',
                'c_id' => 'required',
                'gross_amount' => 'required',
                'net_amount' => 'required',
            ]);

            $data = SalesHeader::create($request->all());

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
            $data = DB::table('sales_headers as sh')->select(['sh.*', 'c.name as c_name'])
                ->leftJoin("customers as c", "c.id", "=", "sh.c_id")->where("sh.id", "=", $id)->get()->first();

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

    public function edit(SalesHeader $request)
    {
    }

    public function update(UpdateSalesHeaderRequest $request, $id)
    {
        try {
            $request->validate([
                'transaction_date' => 'required',
                'c_id' => 'required',
                'gross_amount' => 'required',
                'net_amount' => 'required',
            ]);

            $data = SalesHeader::findOrFail($id);
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
            $data = SalesHeader::findOrFail($id)->delete();
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
            $data = DB::table('sales_headers as sh')->select(['sh.*', 'c.name as c_name'])
                ->leftJoin("customers as c", "c.id", "=", "sh.c_id");

            $startDate = $request->start_date;
            $endDate = $request->end_date;
            if ($startDate != null && $startDate != "" && $endDate != null && $endDate != "") {
                $data = $data->whereDate("transaction_date", ">=", $startDate);
                $data = $data->whereDate("transaction_date", "<=", $endDate);
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

    public function storeHeaderAndLine(StoreSalesHeaderRequest $request)
    {
        $response = DB::transaction(function () use ($request) {
            try {
                $request->validate([
                    'transaction_date' => 'required',
                    'c_id' => 'required',
                    'gross_amount' => 'required',
                    'net_amount' => 'required',
                    'data' => 'required',
                ]);

                $header = [
                    "transaction_date" => $request->transaction_date,
                    "c_id" => $request->c_id,
                    "gross_amount" => $request->gross_amount,
                    "net_amount" => $request->net_amount,
                    "note" => $request->note
                ];
                $headerResponse = SalesHeader::create($header);
                $shId = $headerResponse->id;

                foreach ($request->data as $value) {
                    $lineRequest = [
                        "sh_id" => $shId,
                        "line_no" => $value['line_no'],
                        "i_id" => $value['i_id'],
                        "qty" => $value['qty'],
                        "unit_price" => $value['unit_price'],
                        "net_amount" => $value['net_amount'],
                        "note" => $value['note'],
                    ];
                    $lineResponse = SalesHeaderLine::create($lineRequest);
                    $shlId = $lineResponse->id;

                    $currentStock = Stock::findOrFail($value['i_id']);
                    if ($currentStock->actual_qty > 0) {
                        $currentStock->update(array(
                            'actual_qty' => $currentStock->actual_qty - $value['qty'],
                            'total_qty' => $currentStock->total_qty - $value['qty']
                        ));

                        $stockSql = DB::table("stock_histories")->select()->where("i_id", "=", $value['i_id'])
                            ->where("current_qty", ">", 0)->where("transaction_type", "=", 1)->get();

                        $totalSales = $value['qty'];
                        $i = 0;
                        while ($totalSales > 0) {
                            if ($stockSql[$i]->current_stock >= $totalSales) {
                                $currentStockTemp = $stockSql[$i] - $totalSales;
                                DB::table("stock_histories")->where("id", "=", $stockSql[$i]->id)
                                    ->update(array(
                                        'current_qty' => $currentStockTemp
                                    ));
                                $totalSales = 0;
                            } else {
                                $totalSales = $totalSales - $stockSql[$i];
                                DB::table("stock_histories")->where("id", "=", $stockSql[$i]->id)
                                    ->update(array(
                                        'current_qty' => 0
                                    ));
                            }
                            // $stockSql[$i];

                            $i++;
                        }


                        $historyStock = new StockHistory();
                        $historyStock->i_id = $value['i_id'];
                        $historyStock->hl_id = $shlId;
                        $historyStock->transaction_type = 2;
                        $historyStock->total_qty = $value['qty'];
                        $historyStock->current_qty = $value['qty'];
                        $historyStock->item_price = $value['unit_price'];
                        $historyStock->save();
                    } else {
                        DB::rollBack();
                        return response()->json([
                            'result' => [],
                            'message' => "Stock tidak sesuai"
                        ], JsonResponse::HTTP_CONFLICT);
                    }
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
    }
}
