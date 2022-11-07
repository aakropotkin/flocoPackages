{

  inputs.packument.url   = "https://registry.npmjs.org/ignore?rev=139-8566a0c09041a3c5754c968ad3cb80d3";
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
    ident = "ignore";
    ldir  = "info/unscoped/i/ignore";
    inherit packument fetchInfo;
  } // latest';

}
