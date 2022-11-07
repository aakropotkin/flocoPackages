{

  inputs.packument.url   = "https://registry.npmjs.org/html-loader?rev=100-eed05d530c6aab6f66e8abba2b591774";
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
    ident = "html-loader";
    ldir  = "info/unscoped/h/html-loader";
    inherit packument fetchInfo;
  } // latest';

}
