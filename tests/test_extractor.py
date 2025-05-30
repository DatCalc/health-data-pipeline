from extractor.data_extractor import extract_bpm_bpst

def test_extract():
    result = extract_bpm_bpst({"input": "test"})
    assert "bpm" in result
