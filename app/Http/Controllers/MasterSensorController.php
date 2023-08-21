<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\MasterSensor;
use App\Models\Role;

class MasterSensorController extends Controller
{
    public function index()
    {
        $sensors = MasterSensor::all();
        return response()->json($sensors);
    }

    public function show($sensor)
    {
        $sensor = MasterSensor::find($sensor);
        if (!$sensor) {
            return response()->json(['message' => 'Sensor not found'], 404);
        }
        return response()->json($sensor);
    }

    public function store(Request $request)
    {
        $role_id = $request->user()->role_id;
        $role = Role::find($role_id);

        $sensor = MasterSensor::create([
            'sensor' => $request->sensor,
            'sensor_name' => $request->sensor_name,
            'unit' => $request->unit,
            'created_by' => $role->name,

        ]);
        return response()->json($sensor, 201);
    }

    public function update(Request $request, $sensor)
    {
        $sensorData = MasterSensor::find($sensor);
        if (!$sensorData) {
            return response()->json(['message' => 'Sensor not found'], 404);
        }
        
        $sensorData->update($request->all());
        return response()->json($sensorData);
    }

    public function softDelete($sensor)
    {

        $sensorData = MasterSensor::find($sensor);
        if (!$sensorData) {
            return response()->json(['message' => 'Sensor not found'], 404);
        }
        
        $sensorData->delete();
        return response()->json(['message' => 'Sensor soft deleted'], 204);
    }

    public function hardDelete($sensor)
    {
        $sensorData = MasterSensor::find($sensor);
        if (!$sensorData) {
            return response()->json(['message' => 'Sensor not found.'], 404);
        }
        
        $sensorData->forceDelete();
        return response()->json(['message' => 'Sensor hard deleted'], 204);
    }
}

