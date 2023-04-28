<?php

namespace App\Http\Controllers;

use App\Models\ItemCategory;
use App\Http\Requests\StoreItemCategoryRequest;
use App\Http\Requests\UpdateItemCategoryRequest;
use Exception;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ItemCategoryController extends Controller
{
    public function index()
    {
        try {
            $isActive = 1;
            $data = DB::table('item_categories')->select()->where("active", "=", $isActive)->get();

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

    public function store(StoreItemCategoryRequest $request)
    {
        try {
            $request->validate([
                'name' => 'required',
                'active' => 'required',
            ]);

            $user = ItemCategory::create($request->all());

            return response()->json([
                'result' => $user,
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
            $data = ItemCategory::findOrFail($id);

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

    public function edit(ItemCategory $ItemCategory)
    {
    }

    public function update(UpdateItemCategoryRequest $request, $id)
    {
        try {
            $request->validate([
                'name' => 'required',
                'active' => 'required',
            ]);

            $data = ItemCategory::findOrFail($id);
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
            $data = ItemCategory::findOrFail($id)->delete();
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
            $data = DB::table('item_categories')->select();

            $isActive = $request->is_active;
            if ($isActive == "1" || $isActive == "0") {
                $data = $data->where("active", "=", $isActive);
            }

            $search = $request->search;
            if ($search != null) {
                $data = $data->where("name", "like", "%{$search}%");
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
