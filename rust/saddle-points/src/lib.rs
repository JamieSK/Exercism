pub fn find_saddle_points(input: &[Vec<u64>]) -> Vec<(usize, usize)> {
    let mut saddle_points: Vec<(usize, usize)> = vec![];
    let mut mins_in_y = vec![None; input[0].len()];

    for x in 0..input.len() {
        let max_in_x = input[x].iter().max();
        for y in 0..input[x].len() {
            let min_in_y = match mins_in_y[y] {
                Some(min) => min,
                None => {
                    mins_in_y[y] = Some(input.iter().map(|column| column[y]).min());
                    mins_in_y[y].unwrap()
                }
            };

            if Some(&input[x][y]) == max_in_x && Some(input[x][y]) == min_in_y {
                saddle_points.push((x, y));
            }
        }

    }

    saddle_points
}
