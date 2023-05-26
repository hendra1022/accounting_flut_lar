<?php

namespace App\Http\Controllers;

use App\Http\Requests\StorePurchaseHeaderLineRequest;
use App\Http\Requests\UpdatePurchaseHeaderLineRequest;
use App\Models\PurchaseHeaderLine;
use Exception;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PurchaseHeaderLineController extends Controller
{
    public function index()
    {
        try {
            $data = DB::table('purchase_header_lines')->select()->get();

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

    public function store(StorePurchaseHeaderLineRequest $request)
    {
        try {
            $request->validate([
                'ph_id' => 'required',
                'i_id' => 'required',
                'qty' => 'required',
                'unit_price' => 'required',
                'net_amount' => 'required',
            ]);

            $data = PurchaseHeaderLine::create($request->all());

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
            $data = PurchaseHeaderLine::findOrFail($id);

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

    public function edit(PurchaseHeaderLine $purchaseHeaderLine)
    {
    }

    public function update(UpdatePurchaseHeaderLineRequest $request, $id)
    {
        try {
            $request->validate([
                'ph_id' => 'required',
                'i_id' => 'required',
                'qty' => 'required',
                'unit_price' => 'required',
                'net_amount' => 'required',
            ]);

            $data = PurchaseHeaderLine::findOrFail($id);
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
            $data = PurchaseHeaderLine::findOrFail($id)->delete();
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
            $data = DB::table('purchase_header_lines')->select();

            $headerId = $request->header_id;
            if ($headerId != null && $headerId != 0) {
                $data = $data->where("ph_id", "=", $headerId);
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
}
