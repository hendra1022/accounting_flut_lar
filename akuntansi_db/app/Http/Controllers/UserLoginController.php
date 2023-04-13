<?php

namespace App\Http\Controllers;

use App\Models\UserLogin;
use App\Http\Requests\StoreUserLoginRequest;
use App\Http\Requests\UpdateUserLoginRequest;
use Exception;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class UserLoginController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        try {
            $userLogins = UserLogin::latest()->paginate(    10);
        } catch (Exception $e) {
            return response()->json([
                'data' => [],
                'message'=>$e->getMessage()
            ], JsonResponse::HTTP_INTERNAL_SERVER_ERROR);
        }

        return response()->json([
            'data' => $userLogins,
            'message' => 'Succeed'
        ], JsonResponse::HTTP_OK);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
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
                'message'=>$e->getMessage()
            ], JsonResponse::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(UserLogin $userLogin)
    {
        return response()->json([
            'data' => $userLogin,
            'message' => 'Succeed'
        ], JsonResponse::HTTP_OK);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(UserLogin $userLogin)
    {
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateUserLoginRequest $request, UserLogin $userLogin)
    {
        
        try {
            $request->validate([
                'title' => 'required',
                'body' => 'required',
            ]);
    
            $userLogin->update($request->all());
        } catch (Exception $e) {
            return response()->json([
                'data' => [],
                'message'=>$e->getMessage()
            ], JsonResponse::HTTP_INTERNAL_SERVER_ERROR);
        }

        return response()->json([
            'data' => $userLogin,
            'message' => 'Succeed'
        ], JsonResponse::HTTP_OK);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(UserLogin $userLogin)
    {
        try {
            $userLogin->delete();
        } catch (Exception $e) {
            return response()->json([
                'data' => [],
                'message'=>$e->getMessage()
            ], JsonResponse::HTTP_INTERNAL_SERVER_ERROR);
        }

        return response()->json([
            'data' => $userLogin,
            'message' => 'Succeed'
        ], JsonResponse::HTTP_OK);
    }
}
