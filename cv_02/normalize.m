function v = normalize(vector, pivotIndex)
    pivot = vector(pivotIndex);

    if (pivot == 0)
        v = vector;
        return;
    end

    v = vector ./ pivot;
end