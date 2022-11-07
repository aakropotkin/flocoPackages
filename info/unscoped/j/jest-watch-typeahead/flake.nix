{

  inputs.packument.url   = "https://registry.npmjs.org/jest-watch-typeahead?rev=34-270983db898c45cda1c299cb24f0e4fc";
  inputs.packument.flake = false;

  outputs = inputs: let
    importJSON = f: builtins.fromJSON ( builtins.readFile f );
    packument  = importJSON inputs.packument;
    fetchInfo  = if ! builtins.pathExists ./fetchInfo.json then {} else
                 importJSON ./fetchInfo.json;
    latest'    = if ! ( packument ? dist-tags.latest ) then {} else {
      latestVersion = packument.dist-tags.latest;
      latest        = packument.versions.${packument.dist-tags.latest};
    };
  in {
    scope = null;
    ident = "jest-watch-typeahead";
    ldir  = "info/unscoped/j/jest-watch-typeahead";
    inherit packument fetchInfo;
  } // latest';

}
