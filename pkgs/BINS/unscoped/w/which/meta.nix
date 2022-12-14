{ version }: {
  binInfo.binPairs = if version == "2.0.2" then { which = "bin/node-which"; }
                     else { which = "bin/which"; };
}
