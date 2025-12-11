// This is the Dear Data 100 - Sleeping hours bar chart 
// Adam Adams - Creative Coding Project 

// My sleeping-hour values (currently 100 values)
int[] hours = {
  6,7,8,8,8,7,6,5,7,7,
  8,7,8,7,6,7,7,8,7,5,
  7,8,8,5,6,7,7,7,7,8,
  8,9,9,8,8,8,7,8,7,8,
  5,6,7,8,8,7,7,7,8,9,
  8,8,7,8,7,7,8,6,7,8,7,
  5,6,7,5,6,8,6,7,5,6,
  7,7,7,8,8,8,8,8,7,8,7,
  5,6,6,7,7,7,8,9,7,8,
  8,8,7,8,8,8,7,8,8,9
};

String[] dates;   // will be sized based on hours[]
int days;         // number of days = number of data points

void setup() {
  size(1500, 700);
  background(245);
  smooth();
  textSize(15);
  textAlign(CENTER);

  // number of days comes from the data
  days = hours.length;
  dates = new String[days];

  // Dates formed from 4th September 2025
  int year  = 2025;
  int month = 9;
  int day   = 4;

  for (int i = 0; i < days; i++) {
    String monthStr = nf(month, 2);
    String dayStr   = nf(day, 2);
    dates[i] = year + "-" + monthStr + "-" + dayStr;

    // move to the next day
    day = day + 1;

    // determine days in this month
    int daysInMonth;
    switch (month) {
      case 9:  // This represents September 
      case 11: // This represents November
        daysInMonth = 30;
        break;
      case 10: // This represents October
      case 12: // This represents December
      default:
        daysInMonth = 31;
        break;
    }

    // month rollover
    if (day > daysInMonth) {
      day = 1;
      month = month + 1;
      if (month > 12) {
        month = 1;
        year = year + 1;
      }
    }
  }

  // Draw title 
  fill(0);
  textSize(20);
  text("Welcome to Dear Data 100: Bar Chart of Hours Slept (04 Sept 2025 - …)", width/2, 30);
  textSize(15);

  // Sketching the axes
  stroke(0); // set the line color to black 

  // Horizontal axis (x-axis)
  line(60, height - 40, width - 20, height - 40);

  // Vertical axis (y-axis)
  line(60, height - 40, 60, 40);

  // Y-axis labels representing hours 
  fill(0);
  textAlign(RIGHT);
  for (int hourValue = 4; hourValue <= 9; hourValue++) {

    // Translate the hour value into a screen height position
    float yLevel = map(hourValue, 4, 9, height - 40, 40);

    // Show the hour label right next to the Y-axis
    text(hourValue + " hrs", 55, yLevel + 4);

    // Draw a grid line across the chart at each hour level 
    stroke(201);
    line(60, yLevel, width - 20, yLevel);
  }

  // Illustrating the bars 
  float barWidth = (width - 80) / float(days);

  textAlign(CENTER);

  // Draw each bar of the chart, for each individual day 
  for (int index = 0; index < days; index++) {

    // Find where the bar should appear across the x-axis 
    float xPosition = 60 + index * barWidth;

    // Convert the hours slept into a bar height 
    float sleepHeight = map(hours[index], 0, 9, 0, height - 120);

    // Draw the bar using a red color 
    fill(255, 100, 100);
    noStroke();
    rect(xPosition, (height - 40) - sleepHeight, barWidth - 2, sleepHeight);

    // Label the first day of each month (e.g. "-01")
    if (dates[index].endsWith("-01")) {
      fill(0);
      text(dates[index], xPosition + barWidth / 2, height - 20);
    }
  }

  noLoop(); // static chart
}

void draw() {
  // no animation
}

  
  
  
 
 
 
     
     
     
 
  
   
   
   
 
 

               
