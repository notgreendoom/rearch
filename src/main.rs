use std::{env, fs};
fn main() {
    let filename: Vec<_> = env::args().collect();
    if filename.len() > 3 {
        eprint!("Too many arguments");
        return;
    } else if filename.len() < 3 {
        eprint!("Did not provide a file name or word");
        return;
    }
    let mut line_number = 0;
    let word_to_search = &filename[2];
    let all_file_contents = fs::read_to_string(&filename[1]).expect("Could not read the file");
    for words in all_file_contents.lines() {
        line_number += 1;
        if words.contains(word_to_search) {
            println!("{line_number}: {words}");
        } else {
            continue;
        }
    }
}
