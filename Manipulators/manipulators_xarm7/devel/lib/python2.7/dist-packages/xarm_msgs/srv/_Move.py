# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from xarm_msgs/MoveRequest.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class MoveRequest(genpy.Message):
  _md5sum = "c0e14760ef59968dcef4281098fe75b9"
  _type = "xarm_msgs/MoveRequest"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """# request: command specification for motion executions.
# Units:
#	joint space/angles: radian, radian/s and radian/s^2.
#	Cartesian space: mm, mm/s, and mm/s^2.
#	time: sec

# pose: target coordinate. 
#	For Joint Space target，pose dimention is the number of joints. element as each target joint position.
#	For Cartesian target: pose dimention is 6 for (x, y, z, roll, pitch, yaw)

float32[] pose

# mvvelo: specified maximum velocity during execution. linear or angular velocity 

float32 mvvelo

# mvacc: specified maximum acceleration during execution. linear or angular acceleration.

float32 mvacc

# mvtime: currently do not have any special meaning, please just give it 0. 
# PLEASE NOTE: after firmware version 1.5, For servo_cartesian motion, mvtime will be used as indicator of coordinate system. (0 for BASE coordinate, non-zero for TOOL coordinate)  

float32 mvtime

# mvradii: this is special for move_ineb service, meaning the blending radius between 2 straight path trajectories, 0 for no blend.

float32 mvradii

"""
  __slots__ = ['pose','mvvelo','mvacc','mvtime','mvradii']
  _slot_types = ['float32[]','float32','float32','float32','float32']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       pose,mvvelo,mvacc,mvtime,mvradii

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(MoveRequest, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.pose is None:
        self.pose = []
      if self.mvvelo is None:
        self.mvvelo = 0.
      if self.mvacc is None:
        self.mvacc = 0.
      if self.mvtime is None:
        self.mvtime = 0.
      if self.mvradii is None:
        self.mvradii = 0.
    else:
      self.pose = []
      self.mvvelo = 0.
      self.mvacc = 0.
      self.mvtime = 0.
      self.mvradii = 0.

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      length = len(self.pose)
      buff.write(_struct_I.pack(length))
      pattern = '<%sf'%length
      buff.write(struct.Struct(pattern).pack(*self.pose))
      _x = self
      buff.write(_get_struct_4f().pack(_x.mvvelo, _x.mvacc, _x.mvtime, _x.mvradii))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sf'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.pose = s.unpack(str[start:end])
      _x = self
      start = end
      end += 16
      (_x.mvvelo, _x.mvacc, _x.mvtime, _x.mvradii,) = _get_struct_4f().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      length = len(self.pose)
      buff.write(_struct_I.pack(length))
      pattern = '<%sf'%length
      buff.write(self.pose.tostring())
      _x = self
      buff.write(_get_struct_4f().pack(_x.mvvelo, _x.mvacc, _x.mvtime, _x.mvradii))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sf'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.pose = numpy.frombuffer(str[start:end], dtype=numpy.float32, count=length)
      _x = self
      start = end
      end += 16
      (_x.mvvelo, _x.mvacc, _x.mvtime, _x.mvradii,) = _get_struct_4f().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_4f = None
def _get_struct_4f():
    global _struct_4f
    if _struct_4f is None:
        _struct_4f = struct.Struct("<4f")
    return _struct_4f
# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from xarm_msgs/MoveResponse.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class MoveResponse(genpy.Message):
  _md5sum = "76c68a2c5e109f4d6a4dc1cfc355f405"
  _type = "xarm_msgs/MoveResponse"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """
# response: 
#	ret is 0 for successful execution and others for errors or warnings occured
#	message is a string returned by function, indicating execution status.

int16 ret

string message
"""
  __slots__ = ['ret','message']
  _slot_types = ['int16','string']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       ret,message

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(MoveResponse, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.ret is None:
        self.ret = 0
      if self.message is None:
        self.message = ''
    else:
      self.ret = 0
      self.message = ''

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self.ret
      buff.write(_get_struct_h().pack(_x))
      _x = self.message
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      start = end
      end += 2
      (self.ret,) = _get_struct_h().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.message = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.message = str[start:end]
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self.ret
      buff.write(_get_struct_h().pack(_x))
      _x = self.message
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      start = end
      end += 2
      (self.ret,) = _get_struct_h().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.message = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.message = str[start:end]
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_h = None
def _get_struct_h():
    global _struct_h
    if _struct_h is None:
        _struct_h = struct.Struct("<h")
    return _struct_h
class Move(object):
  _type          = 'xarm_msgs/Move'
  _md5sum = '149d0c53b84d9002e7f64f44b16335dd'
  _request_class  = MoveRequest
  _response_class = MoveResponse