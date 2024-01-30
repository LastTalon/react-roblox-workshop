# Lessons

This directory contains the lessons for all workshops. Each lesson is a
directory that contains a `README.md` file that explains the materials for that
individual lesson.

## Lesson Structure

Each lesson directory typically contains the following structure:

- `README.md`: The lesson's materials and instructions.
- `exercises/`: A directory containing exercises for the lesson.
- `solution/`: Solution files for the corresponding exercises. These contain
  potential solutions to exercises that can be used to verify that the lesson's
  exercises are completed correctly.
- `assets/`: A directory containing assets for the lesson or exercise if
  necessary.
- `*.spec.lua`: Test files for the lesson. These can be used to verify that the
  lesson's exercises are completed correctly.
- `*.story.lua`: Story files for the lesson. These can be used to view the
  lesson's visuals in Roblox Studio.

## Completing Exercises

Exercises are meant to be completed during the workshop, while challenge
problems are meant for students to work on after the workshop or if there is
additional time. Exercises should all be completed, while challenge problems are
optional.

Each exercise and challenge problem should have a corresponding solution. The
solution provided is one possible solution, but there are many others. They also
include tests and stories to help students verify their work.

Students will modify the code for each exercise in the `exercises` folder to
complete the them. Step-by-step instructions for each exercise are included in
the code. Once they have completed the exercise, they can verify their work by
running the tests and story for that exercise and by comparing their code to the
solution in the `solutions` folder.
