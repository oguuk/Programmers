function solution(genres, plays) {
    var dict = {};
    var genrePlayCount = {};

    for (let i = 0; i < genres.length; i++) {
        if (!dict[genres[i]]) dict[genres[i]] = [];
        dict[genres[i]].push({ index: i, plays: plays[i] });

        if (!genrePlayCount[genres[i]]) genrePlayCount[genres[i]] = 0;
        genrePlayCount[genres[i]] += plays[i];
    }

    var sortedGenres = Object.keys(genrePlayCount).sort((a, b) => genrePlayCount[b] - genrePlayCount[a]);

    var answer = [];
    sortedGenres.forEach(genre => {
        var topTwoSongs = dict[genre].sort((a, b) => b.plays - a.plays).slice(0, 2);
        topTwoSongs.forEach(song => answer.push(song.index));
    });

    return answer;
}
