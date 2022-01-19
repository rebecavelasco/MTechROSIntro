
"use strict";

let TCPOffset = require('./TCPOffset.js')
let SetControllerAnalogIO = require('./SetControllerAnalogIO.js')
let SetToolModbus = require('./SetToolModbus.js')
let MoveAxisAngle = require('./MoveAxisAngle.js')
let Move = require('./Move.js')
let GetErr = require('./GetErr.js')
let PlayTraj = require('./PlayTraj.js')
let SetInt16 = require('./SetInt16.js')
let SetFloat32 = require('./SetFloat32.js')
let GripperConfig = require('./GripperConfig.js')
let SetLoad = require('./SetLoad.js')
let MoveVelocity = require('./MoveVelocity.js')
let GetDigitalIO = require('./GetDigitalIO.js')
let SetString = require('./SetString.js')
let GetAnalogIO = require('./GetAnalogIO.js')
let GripperMove = require('./GripperMove.js')
let ConfigToolModbus = require('./ConfigToolModbus.js')
let SetMultipleInts = require('./SetMultipleInts.js')
let SetDigitalIO = require('./SetDigitalIO.js')
let ClearErr = require('./ClearErr.js')
let MoveVelo = require('./MoveVelo.js')
let GetControllerDigitalIO = require('./GetControllerDigitalIO.js')
let GripperState = require('./GripperState.js')
let SetAxis = require('./SetAxis.js')

module.exports = {
  TCPOffset: TCPOffset,
  SetControllerAnalogIO: SetControllerAnalogIO,
  SetToolModbus: SetToolModbus,
  MoveAxisAngle: MoveAxisAngle,
  Move: Move,
  GetErr: GetErr,
  PlayTraj: PlayTraj,
  SetInt16: SetInt16,
  SetFloat32: SetFloat32,
  GripperConfig: GripperConfig,
  SetLoad: SetLoad,
  MoveVelocity: MoveVelocity,
  GetDigitalIO: GetDigitalIO,
  SetString: SetString,
  GetAnalogIO: GetAnalogIO,
  GripperMove: GripperMove,
  ConfigToolModbus: ConfigToolModbus,
  SetMultipleInts: SetMultipleInts,
  SetDigitalIO: SetDigitalIO,
  ClearErr: ClearErr,
  MoveVelo: MoveVelo,
  GetControllerDigitalIO: GetControllerDigitalIO,
  GripperState: GripperState,
  SetAxis: SetAxis,
};
