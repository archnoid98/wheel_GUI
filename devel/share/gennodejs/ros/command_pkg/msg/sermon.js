// Auto-generated. Do not edit!

// (in-package command_pkg.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class sermon {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.advice = null;
      this.speed = null;
    }
    else {
      if (initObj.hasOwnProperty('advice')) {
        this.advice = initObj.advice
      }
      else {
        this.advice = '';
      }
      if (initObj.hasOwnProperty('speed')) {
        this.speed = initObj.speed
      }
      else {
        this.speed = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type sermon
    // Serialize message field [advice]
    bufferOffset = _serializer.string(obj.advice, buffer, bufferOffset);
    // Serialize message field [speed]
    bufferOffset = _serializer.int64(obj.speed, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type sermon
    let len;
    let data = new sermon(null);
    // Deserialize message field [advice]
    data.advice = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [speed]
    data.speed = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.advice);
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'command_pkg/sermon';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b5fad3c1c2010335da2f9cba98fcf299';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string advice
    int64 speed
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new sermon(null);
    if (msg.advice !== undefined) {
      resolved.advice = msg.advice;
    }
    else {
      resolved.advice = ''
    }

    if (msg.speed !== undefined) {
      resolved.speed = msg.speed;
    }
    else {
      resolved.speed = 0
    }

    return resolved;
    }
};

module.exports = sermon;
