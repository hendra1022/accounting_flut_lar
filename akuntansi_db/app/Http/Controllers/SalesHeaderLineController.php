<?php

namespace App\Http\Controllers;

use App\Models\SalesHeaderLine;
use App\Http\Requests\StoreSalesHeaderLineRequest;
use App\Http\Requests\UpdateSalesHeaderLineRequest;
use Exception;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SalesHeaderLineController extends Controller
{
    public function index()
    {
        try {
            $data = DB::table('sales_header_lines')->select()->get();

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

    public function store(StoreSalesHeaderLineRequest $request)
    {
        try {
            $request->validate([
                'sh_id' => 'required',
                'i_id' => 'required',
                'qty' => 'required',
                'unit_price' => 'required',
                'net_amount' => 'required',
            ]);

            $data = SalesHeaderLine::create($request->all());

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
            $data = SalesHeaderLine::findOrFail($id);

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

    public function edit(SalesHeaderLine $purchaseHeaderLine)
    {
    }

    public function update(UpdateSalesHeaderLineRequest $request, $id)
    {
        try {
            $request->validate([
                'sh_id' => 'required',
                'i_id' => 'required',
                'qty' => 'required',
                'unit_price' => 'required',
                'net_amount' => 'required',
            ]);

            $data = SalesHeaderLine::findOrFail($id);
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
            $data = SalesHeaderLine::findOrFail($id)->delete();
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
            $data = DB::table('sales_header_lines')->select();
            $request->validate([
                'header_id' => 'required',
            ]);

            $headerId = $request->header_id;

            $data = DB::table('sales_header_lines as shl')->select(['shl.*', 'i.name as i_name'])
                ->leftJoin("items as i", "i.id", "=", "shl.i_id")->where("shl.sh_id", "=", $headerId);


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
}
