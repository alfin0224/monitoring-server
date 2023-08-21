<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Hardware;
use App\Models\Role;

class HardwareController extends Controller
{
    public function index()
    {
        $hardware = Hardware::all();
        return response()->json($hardware);
    }

    public function show($hardware)
    {
        $hardware = Hardware::findOrFail($hardware);
        return response()->json($hardware);
    }

    public function store(Request $request)
    {
        $role_id = $request->user()->role_id;
        $role = Role::find($role_id);

        $hardwareData = $request->all();
        $hardwareData['created_by'] = $role->name;

        $hardware = Hardware::create($hardwareData);
        return response()->json($hardware, 201);
    }

    public function update(Request $request, $hardware)
    {
        $hardware = Hardware::findOrFail($hardware);
        $hardware->update($request->all());
        return response()->json($hardware, 200);
    }

    public function softDelete($hardware)
    {
        $hardware = Hardware::findOrFail($hardware);
        $hardware->delete();
        return response()->json(['message' => 'Hardware soft deleted'], 204);
    }

    public function hardDelete($hardware)
    {
        $hardware = Hardware::findOrFail($hardware);
        $hardware->forceDelete();
        return response()->json(['message' => 'Hardware hard deleted'], 204);
    }
}

