<?php

namespace App\Http\Controllers;

use App\Models\UserLogin;
use App\Http\Requests\StoreUserLoginRequest;
use App\Http\Requests\UpdateUserLoginRequest;
use Exception;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class UserLoginController extends Controller
{
    public function index()
    {
        try {
            $data = UserLogin::latest()->paginate(10);

            return response()->json([
                'data' => $data,
                'message' => 'Succeed'
            ], JsonResponse::HTTP_OK);
        } catch (Exception $e) {

            return response()->json([
                'data' => [],
                'message' => $e->getMessage()
            ], JsonResponse::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    public function create()
    {
    }

    public function store(StoreUserLoginRequest $request)
    {
        try {
            $request->validate([
                'name' => 'required',
                'email' => 'required',
                'password' => 'required',
            ]);

            $user = UserLogin::create($request->all());

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

    public function show(UserLogin $data)
    {
        return response()->json([
            'data' => $data,
            'message' => 'Succeed'
        ], JsonResponse::HTTP_OK);
    }

    public function edit(UserLogin $userLogin)
    {
    }

    public function update(UpdateUserLoginRequest $request, UserLogin $data)
    {
        try {
            $request->validate([
                'title' => 'required',
                'body' => 'required',
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

    public function destroy(UserLogin $data)
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

    public function coba_get(Request $request)
    {
        $user_id = $request->id;

        $salaries = DB::table('user_logins')
            ->select(["*", "id as abc"])
            ->where('id', '=', $user_id)
            // ->join('companies', 'salaries.company_id', '=', 'companies.id')
            // ->groupBy('companies.id')
            // ->orderByDesc('avg_salary')
            ->get();
        return $salaries;
    }
}
