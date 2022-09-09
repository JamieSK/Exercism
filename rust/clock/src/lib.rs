use std::fmt;

#[derive(Debug, PartialEq)]
pub struct Clock {
    minutes: u32,
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        Clock {
            minutes: 0,
        }.add_minutes(hours * 60 + minutes)
    }

    pub fn add_minutes(self, minutes: i32) -> Self {
        static MINUTES_IN_DAY: i32 = 24 * 60;
        let minutes_change = minutes % MINUTES_IN_DAY;

        let corrected_minutes = match minutes_change >= 0 {
            true => minutes_change as u32,
            false => (MINUTES_IN_DAY + minutes_change).abs() as u32,
        };

        Clock {
            minutes: (self.minutes + corrected_minutes) % MINUTES_IN_DAY as u32,
        }
    }
}

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter) -> Result<(), fmt::Error> {
        write!(f, "{:02}:{:02}", self.minutes / 60, self.minutes % 60)
    }
}