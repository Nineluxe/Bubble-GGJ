

// Initialize Variables
selectedLane = LANE.NONE; // This is the initial highlighted lane
currentStep = STEP.HIGHLIGHT_LANE; // This is the current step the player is on to decide logic.
targetLane = LANE.NONE; // This is the lane you send the bubbles to
queuedBubbles = 0; // This is how many bubbles you want to send
selectedTrafficArray = undefined;

// General Variables
horizontalDirection = 0;
verticalDirection = 0;

pointerFingerArray = [];


currentStepString = "Choose lane"; // This is just for debug to display current step
selectedLaneString = "No Lane";
numberBubbles = 0;