from processors.hr_processor import calculate_hr

def test_hr():
    result = calculate_hr({"signal": [1, 2, 3]})
    assert "hr" in result
