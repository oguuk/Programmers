function solution(clothes) {
    const counts = clothes.reduce((acc, [, type]) => {
        acc[type] = (acc[type] || 0) + 1;
        return acc;
    }, {});

    return Object.values(counts).reduce((total, count) => total * (count + 1), 1) - 1;
}