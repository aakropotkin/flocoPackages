{

  inputs.packument.url   = "https://registry.npmjs.org/wordwrapjs?rev=22-f2acff74d2dec6f730c66d51fb3956dc";
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
    ident = "wordwrapjs";
    ldir  = "info/unscoped/w/wordwrapjs";
    inherit packument fetchInfo;
  } // latest';

}
