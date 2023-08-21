<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MasterSensorController;
use App\Http\Controllers\HardwareController;
use App\Http\Controllers\HardwareDetailController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\DataController;

Route::middleware('auth:sanctum')->group(function () {
    Route::resource('users', UserController::class);
});

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);


Route::middleware(['auth:sanctum'])->group(function () {

    Route::get('/master-sensors', [MasterSensorController::class, 'index']);
    Route::get('/master-sensors/{sensor}', [MasterSensorController::class, 'show']);
    Route::post('/master-sensors', [MasterSensorController::class, 'store'])->middleware('role:1,2');
    Route::put('/master-sensors/{sensor}', [MasterSensorController::class, 'update'])->middleware('role:1,2');
    Route::delete('/master-sensors/hard/{sensor}', [MasterSensorController::class, 'hardDelete'])->middleware('role:1');
    Route::delete('/master-sensors/soft/{sensor}', [MasterSensorController::class, 'softDelete'])->middleware('role:2');

    Route::get('/hardware', [HardwareController::class, 'index']);
    Route::get('/hardware/{hardware}', [HardwareController::class, 'show']);
    Route::post('/hardware', [HardwareController::class, 'store'])->middleware('role:1,2');
    Route::put('/hardware/{hardware}', [HardwareController::class, 'update'])->middleware('role:1,2,3');
    Route::delete('/hardware/hard/{hardware}', [HardwareController::class, 'hardDelete'])->middleware('role:1');
    Route::delete('/hardware/soft/{hardware}', [HardwareController::class, 'softDelete'])->middleware('role:2');
    
    Route::get('/hardware-details', [HardwareDetailController::class, 'index']);
    Route::get('/hardware-details/{id}', [HardwareDetailController::class, 'show']);
    Route::post('/hardware-details', [HardwareDetailController::class, 'store'])->middleware('role:1,2');
    Route::put('/hardware-details/{id}', [HardwareDetailController::class, 'update'])->middleware('role:1,2,3');
    Route::delete('/hardware-details/hard/{id}', [HardwareDetailController::class, 'hardDelete'])->middleware('role:1');
    Route::delete('/hardware-details/soft/{id}', [HardwareDetailController::class, 'softDelete'])->middleware('role:2');
    Route::get('/hardware-sensors', [HardwareDetailController::class, 'getHardwareSensors']);

    Route::post('/data/search', [DataController::class, 'search']);
    Route::post('logout', [AuthController::class, 'logout']);
    Route::get('profile', [AuthController::class, 'profile']);

});


