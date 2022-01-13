List<String> orangeAppleSwitch = [
  "assets/images/apple.png",
  "assets/images/orange.jpg",
  "assets/images/fruits.jpg"
];

List<int> stuckButtonImageList = [2, 2, 2, 2, 2, 2, 2, 2, 2];
int imageSwitcher = 0;

List<List<int>> controlWin = [[], [], []];
int sumControl = 0;

int winnerIndex = 3;

void addDataControlWin() {
  controlWin[0].clear();
  controlWin[0].addAll(
    [
      stuckButtonImageList[0],
      stuckButtonImageList[1],
      stuckButtonImageList[2],
    ],
  );

  controlWin[1].clear();
  controlWin[1].addAll(
    [
      stuckButtonImageList[3],
      stuckButtonImageList[4],
      stuckButtonImageList[5],
    ],
  );

  controlWin[2].clear();
  controlWin[2].addAll(
    [
      stuckButtonImageList[6],
      stuckButtonImageList[7],
      stuckButtonImageList[8],
    ],
  );
}

bool continiueGame() {
  // horizontal checking
  sumControl = 0;
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      sumControl += controlWin[i][j];
    }

    if (sumControl == 0 ||
        (controlWin[i][0] == 1 &&
            controlWin[i][1] == 1 &&
            controlWin[i][2] == 1)) {
      winnerIndex = sumControl ~/ 3;
      return false;
    } else {
      sumControl = 0;
    }
  }

  // vertical checking
  sumControl = 0;

  for (int a = 0; a < 3; a++) {
    for (int b = 0; b < 3; b++) {
      sumControl += controlWin[b][a];
    }

    if (sumControl == 0 ||
        (controlWin[0][a] == 1 &&
            controlWin[1][a] == 1 &&
            controlWin[2][a] == 1)) {
      winnerIndex = sumControl ~/ 3;
      return false;
    } else {
      sumControl = 0;
    }
  }

  // ! dioganal checking
  sumControl = 0;

  // first dioganal
  for (int n = 0; n < 3; n++) {
    sumControl += controlWin[n][n];
  }
  if (sumControl == 0 ||
      (controlWin[0][0] == 1 &&
          controlWin[1][1] == 1 &&
          controlWin[2][2] == 1)) {
    winnerIndex = sumControl ~/ 3;
    return false;
  } else {
    sumControl = 0;
  }

  // second dioganal
  for (int u = 0; u < 3; u++) {
    sumControl += controlWin[u][2 - u];
  }
  if (sumControl == 0 ||
      (controlWin[0][2] == 1 &&
          controlWin[1][1] == 1 &&
          controlWin[2][0] == 1)) {
    winnerIndex = sumControl ~/ 3;
    return false;
  }
  return true;
}

String chanceChange() {
  return imageSwitcher == 0 ? "Orange" : "Apple";
}

String winnerChange() {
  if (winnerIndex == 1) {
    winnerIndex = 3;
    return "Orange Won";
  }
  winnerIndex = 3;
  return "Apple Won";
}


