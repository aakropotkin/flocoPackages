{

  inputs.packument.url   = "https://registry.npmjs.org/axios?rev=771-47eb19eb8d79e802e0cce0bf61c9a853";
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
    ident = "axios";
    ldir  = "info/unscoped/a/axios";
    inherit packument fetchInfo;
  } // latest';

}
