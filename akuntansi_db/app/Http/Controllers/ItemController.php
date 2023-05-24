<?php

namespace App\Http\Controllers;

use App\Models\Item;
use App\Http\Requests\StoreItemRequest;
use App\Http\Requests\UpdateItemRequest;
use App\Models\Stock;
use Exception;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ItemController extends Controller
{
    public function index()
    {
        try {
            $data = DB::table('items')->select()->get();

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

    public function store(StoreItemRequest $request)
    {
        $response = DB::transaction(function () use ($request) {
            try {
                $request->validate([
                    'name' => 'required',
                    'ic_id' => 'required',
                ]);

                $itemResponse = Item::create($request->all());
                $iId = $itemResponse->id;

                $model = new Stock();
                $model->i_id = $iId;
                $model->actual_qty = 0;
                $model->total_qty = 0;
                $model->save();

                return response()->json([
                    'result' => $itemResponse,
                    'message' => 'Succeed'
                ], JsonResponse::HTTP_OK);
            } catch (Exception $e) {
                DB::rollBack();
                return response()->json([
                    'result' => [],
                    'message' => $e->getMessage()
                ], JsonResponse::HTTP_INTERNAL_SERVER_ERROR);
            }
        });

        return $response;
    }

    public function show($id)
    {
        try {
            // $data = Item::findOrFail($id);
            $data = DB::table('items as i')->select(['i.*', 'ic.id as ic_id', 'ic.name as ic_name'])
                ->leftJoin("item_categories as ic", "ic.id", "=", "i.ic_id")->where("i.id", "=", $id)->get()->first();

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

    public function edit(Item $Item)
    {
    }

    public function update(UpdateItemRequest $request, $id)
    {
        try {
            $request->validate([
                'name' => 'required',
                'active' => 'required',
            ]);

            $data = Item::findOrFail($id);
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
            $data = Item::findOrFail($id)->delete();
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
            $data = DB::table('items as i')->select(['i.*', 'ic.id as ic_id', 'ic.name as ic_name']);

            $isActive = $request->is_active;
            if ($isActive == "1" || $isActive == "0") {
                $data = $data->where("i.active", "=", $isActive);
            }

            $search = $request->search;
            if ($search != null) {
                $data = $data->where("i.name", "like", "%{$search}%");
            }

            $itemCatId = $request->item_cat_id;
            if ($itemCatId != null && $itemCatId != 0) {
                $data = $data->where("i.ic_id", "=", $itemCatId);
            }

            $data = $data->leftJoin("item_categories as ic", "ic.id", "=", "i.ic_id");

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
