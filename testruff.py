# testruff.py
def very_long_function_name_that_is_not_recommended_and_should_be_shortened_because_it_exceeds_the_maximum_line_length_limit():
    print(
        "This is a very long string that should be flagged by linters because it exceeds the recommended maximum line length which is typically 79 or 80 characters for Python code. This string is just an example."
    )


def another_function_with_issues():
    x = 1
    y = 2
    z = x + y
    print("The result is:", z)  # This line is fine
    print(
        "Another long line that exceeds the recommended line length limit and should be flagged by the linter as an error in the codebase for better readability."
    )

    if x < y:
        print("X is less than Y")
    else:
        print("X is greater than or equal to Y")


# Extra blank line below (not recommended)


def function_with_extra_blank_line_above():
    return "This function has an extra blank line above it."


# Trailing whitespace below this line (should be flagged)


def function_with_trailing_whitespace():
    return "This function has trailing whitespace on the previous line."


def function_with_multiple_issues(x, y):
    if x > y:
        print("X is greater")  # Inline if-statement (not recommended)
    else:
        print("Y is greater or equal")
    return x + y  # Multiple spaces (should be flagged by linters)


def badly_formatted_function():
    print("This should be properly formatted")
