{

  inputs.packument.url   = "https://registry.npmjs.org/vasync?rev=113-e7492529d20d85b7f9d3b339b8b4fee0";
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
    ident = "vasync";
    ldir  = "info/unscoped/v/vasync";
    inherit packument fetchInfo;
  } // latest';

}
