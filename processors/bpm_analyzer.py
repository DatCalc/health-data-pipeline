def analyze_bpm(data):
    if data.get("metric") == "hr":
        from .hr_processor import calculate_hr
        return calculate_hr(data)
