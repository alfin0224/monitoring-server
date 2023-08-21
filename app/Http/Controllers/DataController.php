<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Hardware;
use App\Models\Transaksi;
use App\Models\TransaksiDetail;

class DataController extends Controller
{
    public function search(Request $request)
    {
        $fromDate = $request->input('from_date');
        $toDate = $request->input('to_date');
        $hardwareId = $request->input('hardware_id');

        $hardware = Hardware::findOrFail($hardwareId);

        $transactions = Transaksi::where('hardware', $hardwareId)
            ->whereBetween('created_at', [$fromDate, $toDate])
            ->get();

        $location = $hardware->location;
        $coordinate = $hardware->latitude . ', ' . $hardware->longitude;
        $lastSend = $transactions->last()->created_at;
        $maxValue = TransaksiDetail::where('hardware', $hardwareId)->max('value');
        $minValue = TransaksiDetail::where('hardware', $hardwareId)->min('value');

        $data = [
            'Location' => $location,
            'Coordinate' => $coordinate,
            'Last Send' => $lastSend,
            'Maximal Value' => $maxValue,
            'Minimal Value' => $minValue,
        ];

        $sensorData = [];

        foreach ($transactions as $transaction) {
            $transaksiDetail = TransaksiDetail::where('trans_id', $transaction->trans_id)->get();
            $sensorData[$transaction->created_at->format('Y-m-d H:i:s')] = $transaksiDetail->pluck('value');
        }

        return response()->json([
            'data' => $data,
            'sensor_data' => $sensorData,
        ]);
    }
}
