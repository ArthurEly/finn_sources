from typing import TypedDict, Dict, List

class FeederConfig(TypedDict):
    memory_data_width: int
    memory_address_width: int
    input_shape: List[int]
    output_shape: List[int]

class IOBits(TypedDict):
    s_axis_0: int
    m_axis_0: int