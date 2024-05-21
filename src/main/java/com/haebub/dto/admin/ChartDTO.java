package com.haebub.dto.admin;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ChartDTO {
    private String[] labels;
    private ChartTestDTO[] datasets;
}