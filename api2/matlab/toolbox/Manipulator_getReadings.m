%% Manipulator_getReadings
% Obtain readings from Robotino's manipulator.
% Do not forget to call <Manipulator_grab.html Manipulator_grab> first.
% Make sure that the angles, speeds, cwAxesLimits, ccwAxesLimits arrays are
% at least 9 in size.
%% Function 
% |[ success, seq, angles, numAngles, speeds, numSpeeds, errors, numErrors,
% motors_enabled, store_current_position, cwAxesLimits, numCwAxesLimits,
% ccwAxesLimits, numCcwAxesLimits ] = Manipulator_getReadings( ManipulatorId )|
%
% ManipulatorId is the id of the Manipulator object.
%% Example Usage 
% |[ success, seq, angles, numAngles, speeds, numSpeeds, errors,
% numErrors, motors_enabled, store_current_position, cwAxesLimits,
% numCwAxesLimits, ccwAxesLimits, numCcwAxesLimits ] =
% Manipulator_getReadings( 0 )|
%% See also
% <example_matlab_Manipulator.html Manipulator Example>
function [ success, seq, angles, numAngles, speeds, numSpeeds, errors, numErrors, motors_enabled, store_current_position, cwAxesLimits, numCwAxesLimits, ccwAxesLimits, numCcwAxesLimits ] = Manipulator_getReadings( ManipulatorId )
if ( init )
    seq_Buffer = 0;
    seq_BufferPtr = libpointer( 'uint32Ptr', seq_Buffer);
    
    angles_Buffer = zeros(9,1);
    angles_BufferPtr = libpointer( 'singlePtr', angles_Buffer);
    
    numAngles_Buffer = 0;
    numAngles_BufferPtr = libpointer( 'uint32Ptr', numAngles_Buffer);
    
    speeds_Buffer = zeros(9,1);
    speeds_BufferPtr = libpointer( 'singlePtr', speeds_Buffer);
    
    numSpeeds_Buffer = 0;
    numSpeeds_BufferPtr = libpointer( 'uint32Ptr', numSpeeds_Buffer);
    
    errors_Buffer = zeros(9,1);
    errors_BufferPtr = libpointer( 'int32Ptr', errors_Buffer);
    
    numErrors_Buffer = 0;
    numErrors_BufferPtr = libpointer( 'uint32Ptr', numErrors_Buffer);
    
    motors_enabled_Buffer = 0;
    motors_enabled_BufferPtr = libpointer( 'int32Ptr', motors_enabled_Buffer);
    
    store_current_position_Buffer = 0;
    store_current_position_BufferPtr = libpointer( 'int32Ptr', store_current_position_Buffer);
    
    cwAxesLimits_Buffer = zeros(9,1);
    cwAxesLimits_BufferPtr = libpointer( 'singlePtr', cwAxesLimits_Buffer);
    
    numCwAxesLimits_Buffer = 0;
    numCwAxesLimits_BufferPtr = libpointer( 'uint32Ptr', numCwAxesLimits_Buffer);
    
    ccwAxesLimits_Buffer = zeros(9,1);
    ccwAxesLimits_BufferPtr = libpointer( 'singlePtr', ccwAxesLimits_Buffer);
    
    numCcwAxesLimits_Buffer = 0;
    numCcwAxesLimits_BufferPtr = libpointer( 'uint32Ptr', numCcwAxesLimits_Buffer);
    
    success = calllib( 'rec_robotino_api2','Manipulator_getReadings', ManipulatorId, seq_BufferPtr, angles_BufferPtr, numAngles_BufferPtr, speeds_BufferPtr, numSpeeds_BufferPtr, errors_BufferPtr, numErrors_BufferPtr, motors_enabled_BufferPtr, store_current_position_BufferPtr, cwAxesLimits_BufferPtr, numCwAxesLimits_BufferPtr, ccwAxesLimits_BufferPtr, numCcwAxesLimits_BufferPtr);
    seq = uint32( get( seq_BufferPtr, 'Value' ) );
    angles = single( get( angles_BufferPtr, 'Value' ) );
    numAngles = uint32( get( numAngles_BufferPtr, 'Value' ) );
    speeds = single( get( speeds_BufferPtr, 'Value' ) );
    numSpeeds = uint32( get( numSpeeds_BufferPtr, 'Value' ) );
    errors = int32( get( errors_BufferPtr, 'Value' ) );
    numErrors = uint32( get( numErrors_BufferPtr, 'Value' ) );
    motors_enabled = int32( get( motors_enabled_BufferPtr, 'Value' ) );
    store_current_position = int32( get( store_current_position_BufferPtr, 'Value' ) );
    cwAxesLimits = single( get( cwAxesLimits_BufferPtr, 'Value' ) );
    numCwAxesLimits = uint32( get( numCwAxesLimits_BufferPtr, 'Value' ) );
    ccwAxesLimits = single( get( ccwAxesLimits_BufferPtr, 'Value' ) );
    numCcwAxesLimits = uint32( get( numCcwAxesLimits_BufferPtr, 'Value' ) );
end;