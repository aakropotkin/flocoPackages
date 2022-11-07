{

  inputs.packument.url   = "https://registry.npmjs.org/jest-resolve?rev=372-097a65e0960b6b4a8db8af0ff17798a2";
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
    ident = "jest-resolve";
    ldir  = "info/unscoped/j/jest-resolve";
    inherit packument fetchInfo;
  } // latest';

}
