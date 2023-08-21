<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\HardwareDetail;
use App\Models\MasterSensor;
use App\Models\Hardware;

class HardwareDetailController extends Controller
{
    public function index()
    {
        $hardwareDetails = HardwareDetail::with(['hardware', 'sensor'])->get();
        return response()->json($hardwareDetails);
    }

    public function show($id)
    {
        $hardwareDetail = HardwareDetail::findOrFail($id);
        return response()->json($hardwareDetail);
    }

    public function store(Request $request)
    {
        $hardwareDetail = HardwareDetail::create($request->all());
        return response()->json($hardwareDetail, 201);
    }

    public function update(Request $request, $id)
    {
        $hardwareDetail = HardwareDetail::findOrFail($id);
        $hardwareDetail->update($request->all());
        return response()->json($hardwareDetail, 200);
    }

    public function softDelete($id)
    {
        $hardwareDetail = HardwareDetail::findOrFail($id);
        $hardwareDetail->delete();
        return response()->json(['message' => 'Hardware Detail soft deleted'], 204);
    }

    public function hardDelete($id)
    {
        $hardwareDetail = HardwareDetail::findOrFail($id);
        $hardwareDetail->forceDelete();
        return response()->json(['message' => 'Hardware Detail hard deleted'], 204);
    }

    public function getHardwareSensors()
    {
        $hardwareData = HardwareDetail::select('hardware', 'sensor')
            ->whereNull('deleted_at')
            ->orderBy('hardware')
            ->get();

        $result = [];

        foreach ($hardwareData as $data) {
            if (!isset($result[$data->hardware])) {
                $result[$data->hardware] = [];
            }

            $sensorName = $this->getSensorName($data->sensor);
            if ($sensorName) {
                $result[$data->hardware][] = $sensorName;
            }
        }

        return response()->json($result);
    }

    private function getSensorName($sensorCode)
    {
        switch ($sensorCode) {
            case 'rf':
                return 'Rainfall (mm)';
            case 'wl':
                return 'Water Level (cm)';
            case 'bt':
                return 'Battery (Volt)';
            case 'ah':
                return 'Air Humidity (%)';
            case 'ws':
                return 'Wind Speed (m/s)';
            default:
                return null;
        }
    }
}
