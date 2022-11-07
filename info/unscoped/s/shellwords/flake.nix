{

  inputs.packument.url   = "https://registry.npmjs.org/shellwords?rev=18-b8ca1c9c505d2283d415a8099338322f";
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
    ident = "shellwords";
    ldir  = "info/unscoped/s/shellwords";
    inherit packument fetchInfo;
  } // latest';

}
