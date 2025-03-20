% Robotino
%
% Files
%   AnalogInput_construct                   - Construct an AnalogInput object
%   AnalogInput_destroy                     - Destroy the AnalogInput object assigned to AnalogInputId
%   AnalogInput_num                         - Returns the number of analog inputs.
%   AnalogInput_setComId                    - Associate an AnalogInput object with a communication interface
%   AnalogInput_value                       - Returns the current value of the specified AnalogInput device.
%   Bumper_construct                        - Construct a Bumper object
%   Bumper_destroy                          - Destroy the Bumper object assigned to a BumperId
%   Bumper_setComId                         - Associate a bumper object with a communication interface
%   Bumper_value                            - Returns the current state of the bumper.
%   Camera_construct                        - Construct a Camera object
%   Camera_destroy                          - Destroy the Camera object assigned to a CameraId
%   Camera_getImage                         - Returns Robotino's camera image. 
%   Camera_grab                             - Grab image from Camera
%   Camera_imageSize                        - Returns size of the image acquired by Camera_grab
%   Camera_setComId                         - Associate a Camera object with a communication interface
%   Com_connect                             - Establish the communication with the robot 
%   Com_construct                           - Construct an interface for communicating to one Robotino
%   Com_destroy                             - Destroy the communication interface assigned to ComId
%   Com_disconnect                          - Stop communication.
%   Com_isConnected                         - Check if the communication is established
%   Com_setAddress                          - Set the address of Robotino through which the ComId communicates
%   CompactBHA_construct                    - Construct a CompactBHA object
%   CompactBHA_destroy                      - Destroy the CompactBHA object assigned to CompactBHAId
%   CompactBHA_foilPot                      - Returns the current value of the foil pot of the CompactBHA device.
%   CompactBHA_pressures                    - Returns the pressures of all bellows of the CompactBHA device.
%   CompactBHA_pressureSensor               - Returns the signal from the pressure sensor of the CompactBHA device.
%   CompactBHA_setComId                     - Associate a CompactBHA object with a communication interface
%   CompactBHA_setCompressorsEnabled        - Enables and disables the compressors of the CompactBHA device.
%   CompactBHA_setGripperValve1             - Opens and closes the gripper valve 1 of the CompactBHA device.
%   CompactBHA_setGripperValve2             - Opens and closes the gripper valve 2 of the CompactBHA device.
%   CompactBHA_setPressures                 - Sets the pressures of all bellows of the CompactBHA device.
%   CompactBHA_setWaterDrainValve           - Opens and closes the water drain valve of the CompactBHA device.
%   CompactBHA_stringPots                   - Returns the current values of the string pots of the CompactBHA device.
%   DigitalInput_construct                  - Construct a DigitalInput object
%   DigitalInput_destroy                    - Destroy the DigitalInput object assigned to DigitalInputId
%   DigitalInput_num                        - Returns the number of digital inputs.
%   DigitalInput_setComId                   - Associate a DigitalInput object with a communication interface
%   DigitalInput_value                      - Returns the current value of the specified DigitalInput device.
%   DigitalOutput_construct                 - Construct a DigitalOutput object
%   DigitalOutput_destroy                   - Destroy the DigitalOutput object assigned to DigitalOutputId
%   DigitalOutput_num                       - Returns the number of digital outputs.
%   DigitalOutput_setComId                  - Associate a DigitalOutput object with a communication interface
%   DigitalOutput_setValue                  - Sets the value of the specified output device
%   DistanceSensor_construct                - Construct a DistanceSensor object
%   DistanceSensor_destroy                  - Destroy the DistanceSensor object assigned to DistanceSensorId
%   DistanceSensor_heading                  - Returns the heading of a DistanceSensor
%   DistanceSensor_num                      - Returns the number of distance sensors
%   DistanceSensor_setComId                 - Associate a DistanceSensor object with a communication interface
%   DistanceSensor_voltage                  - Returns the voltage value of the specified DistanceSensor device.
%   EncoderInput_construct                  - Construct an EncoderInput object
%   EncoderInput_destroy                    - Destroy the EncoderInput object assigned to EncoderInputId
%   EncoderInput_position                   - Returns the actual position in ticks since power on or Encoder_resetPosition
%   EncoderInput_resetPosition              - Sets the current position to zero
%   EncoderInput_setComId                   - Associate a EncoderInput object with a communication interface
%   EncoderInput_velocity                   - Returns the actual velocity in ticks/s
%   example_matlab_DistanceSensor           - Distance Sensor Example
%   example_matlab_LaserRangeFinder         - Laser Range Finder Example
%   example_matlab_LineFollowerAnalogInput  - Analog Input Example
%   example_matlab_LineFollowerCamera       - Camera Example
%   example_matlab_LineFollowerDigitalInput - Digital Input Example
%   example_matlab_Manipulator              - Manipulator Example
%   Gripper_close                           - Closes the gripper
%   Gripper_construct                       - Constructs a Gripper object
%   Gripper_destroy                         - Destroys the Gripper object assigned to GripperId
%   Gripper_isClosed                        - Returns true (1) if the gripper is closed, false (0) otherwise
%   Gripper_isOpened                        - Returns true (1) if the gripper is opened, false (0) otherwise
%   Gripper_open                            - Opens the gripper
%   Gripper_setComId                        - Associate a Gripper object with a communication interface
%   Info_construct                          - Constructs an Info object
%   Info_destroy                            - Destroys the Info object assigned to InfoId
%   Info_setComId                           - Associate an Info object with a communication interface
%   init                                    - Init file
%   LaserRangeFinder_construct              - Constructs a LaserRangeFinder object
%   LaserRangeFinder_destroy                - Destroys the LaserRangeFinder object assigned to LaserRangeFinderId
%   LaserRangeFinder_getReadings            - Obtain readings from Robotino's laser rangefinder
%   LaserRangeFinder_grab                   - Grab readings from laser rangefinder
%   LaserRangeFinder_setComId               - Associate a LaserRangeFinder object with a communication interface
%   lineDetector                            - Returns the x-position of a line.
%   Manipulator_construct                   - Constructs a Manipulator object
%   Manipulator_destroy                     - Destroys the Manipulator object assigned to ManipulatorId
%   Manipulator_getReadings                 - Obtain readings from Robotino's manipulator
%   Manipulator_grab                        - Grab readings from Robotino's manipulator
%   Manipulator_setAxes                     - Set position and speed of Axes
%   Manipulator_setAxis                     - Set position and speed of on Axis
%   Manipulator_setComId                    - Associate a Manipulator object with a communication interface
%   Motor_actualPosition                    - Retrieves the actual position of a motor
%   Motor_actualSpeed                       - Retrieves the actual speed (rpm) of a motor
%   Motor_construct                         - Constructs a Motor object of a motor number n
%   Motor_destroy                           - Destroys the Motor object assigned to MotorId
%   Motor_motorCurrent                      - Retrieves the current (A) of a motor
%   Motor_num                               - Returns the number of drive motors on Robotino
%   Motor_rawCurrentMeasurment              - Retrieves the current delivered to a motor
%   Motor_resetPosition                     - Resets the position of a motor
%   Motor_setBrake                          - Controls the brake of a motor
%   Motor_setComId                          - Associate a Motor object with a communication interface
%   Motor_setPID                            - Sets the proportional, integral and differential constant of the PID
%   Motor_setSetPointSpeed                  - Sets the setpoint speed of this motor
%   Odometry_construct                      - Constructs an Odometry object
%   Odometry_destroy                        - Destroys the Odometry object assigned to OdometryId
%   Odometry_get                            - Returns the global x, y position and phi orientation of Robotino
%   Odometry_set                            - Sets Robotino's odometry to the given coordinates
%   Odometry_setComId                       - Associate a Odometry object with a communication interface
%   OmniDrive_construct                     - Constructs an OmniDrive object
%   OmniDrive_destroy                       - Destroys the OmniDrive object assigned to OmniDriveId
%   OmniDrive_getVelocities                 - Project the velocity of the robot in cartesian coordinates to single motor speeds
%   OmniDrive_setComId                      - Associate an OmniDrive object with a communication interface
%   OmniDrive_setVelocity                   - Drive Robotino
%   PowerManagement_construct               - Constructs a PowerManagement object
%   PowerManagement_current                 - Retrieves the current power drain
%   PowerManagement_destroy                 - Destroys the PowerManagement object assigned to PowerManagementId
%   PowerManagement_setComId                - Associate a PowerManagement object with a communication interface
%   PowerManagement_voltage                 - Retrieves the battery voltage
%   PowerOutput_construct                   - Constructs a PowerOutput object
%   PowerOutput_current                     - Returns the current delivered by the power output in A
%   PowerOutput_destroy                     - Destroys the PowerOutput object assigned to PowerOutputId
%   PowerOutput_rawCurrentMeasurment        - Returns the current delivered by the power output. Range from 0 - 1023
%   PowerOutput_setComId                    - Associate a PowerOutput object with a communication interface
%   PowerOutput_setValue                    - Sets the current set point of the power output
%   Relay_construct                         - Constructs a Relay object of number n
%   Relay_destroy                           - Destroys the Relay object assigned to RelayId
%   Relay_num                               - Returns the number of drive relays on Robotino
%   Relay_setComId                          - Associate a Relay object with a communication interface
%   Relay_setValue                          - Sets the setpoint speed of a relay
%   LaserRangeFinder_construct              - Constructs a LaserRangeFinder object
%   LaserRangeFinder_destroy                - Destroys the LaserRangeFinder object assigned to LaserRangeFinderId
%   LaserRangeFinder_getReadings            - Obtain readings from Robotino's laser rangefinder
%   LaserRangeFinder_grab                   - Grab readings from laser rangefinder
%   LaserRangeFinder_setComId               - Associate a LaserRangeFinder object with a communication interface
%   lineDetector                            - Returns the x-position of a line.
%   Kinect_construct                        - Constructs a Kinect object
%   Kinect_destroy                          - Destroys the LaserRangeFinder object assigned to LaserRangeFinderId
%   Kinect_getReadings                      - Obtain readings from Robotino's kinect sensor
%   Kinect_grab                             - Grab readings from kinect sensor
%   Kinect_setComId                         - Associate a Kinect object with a communication interface
%   Kinect_setKinectNumber                  - Set which kinect to use
%   Kinect_dataSize                         - Get data size of readings
%   lineDetector                            - Returns the x-position of a line.
