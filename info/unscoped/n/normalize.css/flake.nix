{

  inputs.packument.url   = "https://registry.npmjs.org/normalize.css?rev=124-e36507511ab918ffa9bf3ee9136fe109";
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
    ident = "normalize.css";
    ldir  = "info/unscoped/n/normalize.css";
    inherit packument fetchInfo;
  } // latest';

}
