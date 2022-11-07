{

  inputs.packument.url   = "https://registry.npmjs.org/units-css?rev=7-7d5b14dd7a8111f70272e60f611398b1";
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
    ident = "units-css";
    ldir  = "info/unscoped/u/units-css";
    inherit packument fetchInfo;
  } // latest';

}
