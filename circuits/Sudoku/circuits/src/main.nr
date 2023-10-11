use dep::std;

// Given a 4x4 sudoku board with array signal input "question" and "solution", check if the solution is correct.

//     "question" is a 16 length array. Example: [0,4,0,0,0,0,1,0,0,0,0,3,2,0,0,0] == [0, 4, 0, 0]
//                                                                                    [0, 0, 1, 0]
//                                                                                    [0, 0, 0, 3]
//                                                                                    [2, 0, 0, 0]

//     "solution" is a 16 length array. Example: [1,4,3,2,3,2,1,4,4,1,2,3,2,3,4,1] == [1, 4, 3, 2]
//                                                                                    [3, 2, 1, 4]
//                                                                                    [4, 1, 2, 3]
//                                                                                    [2, 3, 4, 1]


fn verify_question(question: [Field; 4]) {
    let mut m: [Field; 4] = [0; 4];
    for i in 0..4 {
        let mut a = question[i];
        assert(a == question[i]);
        let mut b = 0;
        assert(b == 0);
        let c =  a==b; 
        m[i] = c as Field;
    }
    assert(3 == (m[0] + m[1] +m[2] + m[3]));
}

fn verify_answer_dim(answer: [Field; 4]) {
    // Check at least 1 record is 1, 2, 3, 4
    std::println(answer);
    assert(answer.any(|i| i == 1));
    assert(answer.any(|i| i == 2));
    assert(answer.any(|i| i == 3));
    assert(answer.any(|i| i == 4));
}

fn verify_q_and_a(question: [Field; 16], answer: [Field; 16]) {
    for i in 0..16 {
        if question[i] != 0 {
            assert(question[i] == answer[i]);
        }
    }
}


fn slice_row(arr: [Field; 16], row: u8) -> [Field; 4] {
    let mut m: [Field; 4] = [0; 4];
    for i in 0..4 {
        m[i] = arr[4*row+i];
    }
    m
}

fn slice_col(arr: [Field; 16], col: u8) -> [Field; 4] {
    let mut m: [Field; 4] = [0; 4];
    for i in 0..4 {
        m[i] = arr[col+i*4];
    }
    m
}


fn main(question: pub [Field; 16], answer : [Field; 16]) {
       
    // Verifying the Question
    for i in 0..16 {
        let mut a = question[i] == answer[i];
        let mut b = question[i] == 0;
        let c = a | b;
        assert(c == true);
    }

    // Check first row has 3 inputs as 0 and 1 input as non zero
    let q0 = slice_row(question, 0);
    let q1 = slice_row(question, 1);
    let q2 = slice_row(question, 2);
    let q3 = slice_row(question, 3);

    verify_question(q0);
    verify_question(q1);
    verify_question(q2);
    verify_question(q3);

    // Verify the answer meets the question constraints
    verify_q_and_a(question, answer);

    // Verify answer is a valid Sudoku solution
    let r0 = slice_row(answer, 0);  let c0 = slice_col(answer, 0);
    let r1 = slice_row(answer, 1);  let c1 = slice_col(answer, 1);
    let r2 = slice_row(answer, 2);  let c2 = slice_col(answer, 2);
    let r3 = slice_row(answer, 3);  let c3 = slice_col(answer, 3);

    verify_answer_dim(r0);          verify_answer_dim(c0);
    verify_answer_dim(r1);          verify_answer_dim(c1);
    verify_answer_dim(r2);          verify_answer_dim(c2);
    verify_answer_dim(r3);          verify_answer_dim(c3);
}