<busyYearsForArtists>

    {
        for $artists in doc("../resources/art-xsd.xml")//artist
        let $objects := doc("../resources/art-xsd.xml")//object[.//by = $artists/name]
        for $years in distinct-values($objects//year)
        let $isBusyYear := $objects[.//year = $years]
        where count($isBusyYear) >= 3
        order by $artists/name

        return <artist name = "{ $artists/name }" year = "{ $years }">
            <objectCount> { count($isBusyYear) } </objectCount>
            {
                for $i in $objects[position() = 1 to 3] (:count($isBusyYear):)
                return
                    <object>
                        { distinct-values($i/title/text()) }
                    </object>
            }
        </artist>
    }

</busyYearsForArtists>

