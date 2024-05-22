package com.haebub.dto.admin;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChartTestDTO {
    private String label;
    private int[] data;
    private String borderColor;
}
