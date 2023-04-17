<?php

namespace App\Http\Controllers;

use App\Models\CustomerType;
use App\Http\Requests\StoreCustomerTypeRequest;
use App\Http\Requests\UpdateCustomerTypeRequest;
use Exception;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CustomerTypeController extends Controller
{
    public function index()
    {
        try {
            $data = CustomerType::latest()->paginate(25);

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

    public function store(StoreCustomerTypeRequest $request)
    {
        try {
            $request->validate([
                'name' => 'required',
                'active' => 'required',
            ]);

            $user = CustomerType::create($request->all());

            return response()->json([
                'data' => $user,
                'message' => 'Succeed'
            ], JsonResponse::HTTP_OK);
        } catch (Exception $e) {
            return response()->json([
                'data' => [],
                'message' => $e->getMessage()
            ], JsonResponse::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    public function show(CustomerType $data)
    {
        return response()->json([
            'data' => $data,
            'message' => 'Succeed'
        ], JsonResponse::HTTP_OK);
    }

    public function edit(CustomerType $CustomerType)
    {
    }

    public function update(UpdateCustomerTypeRequest $request, CustomerType $data)
    {
        try {
            $request->validate([
                'name' => 'required',
                'active' => 'required',
            ]);

            $data->update($request->all());
        } catch (Exception $e) {
            return response()->json([
                'data' => [],
                'message' => $e->getMessage()
            ], JsonResponse::HTTP_INTERNAL_SERVER_ERROR);
        }

        return response()->json([
            'data' => $data,
            'message' => 'Succeed'
        ], JsonResponse::HTTP_OK);
    }

    public function destroy(CustomerType $data)
    {
        try {
            $data->delete();
        } catch (Exception $e) {
            return response()->json([
                'data' => [],
                'message' => $e->getMessage()
            ], JsonResponse::HTTP_INTERNAL_SERVER_ERROR);
        }

        return response()->json([
            'data' => $data,
            'message' => 'Succeed'
        ], JsonResponse::HTTP_OK);
    }

    public function indexByParam(Request $request)
    {
        try {
            $isActive = $request->is_active;

            $rowPerPage = $request->row_per_page;
            if ($rowPerPage == null) {
                $rowPerPage = 10;
            }

            $search = $request->search;

            // $data = CustomerType::latest()->paginate($rowPerPage);
            $data = DB::table('customer_types')->select();
            if ($isActive == "1" || $isActive == "0") {
                $data = $data->where("active", "=", $isActive);
            }
            if ($search != null) {
                $data = $data->where("name", "like", "%{$search}%");
            }
            $data = $data->paginate($rowPerPage);

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
