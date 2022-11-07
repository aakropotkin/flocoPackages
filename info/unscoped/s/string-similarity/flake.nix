{

  inputs.packument.url   = "https://registry.npmjs.org/string-similarity?rev=34-7ec03081b06c3eefda85bafc13725a39";
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
    ident = "string-similarity";
    ldir  = "info/unscoped/s/string-similarity";
    inherit packument fetchInfo;
  } // latest';

}
