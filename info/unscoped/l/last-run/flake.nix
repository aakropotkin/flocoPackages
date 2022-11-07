{

  inputs.packument.url   = "https://registry.npmjs.org/last-run?rev=14-a2076070a0563ba367ff1eb55fdf66de";
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
    ident = "last-run";
    ldir  = "info/unscoped/l/last-run";
    inherit packument fetchInfo;
  } // latest';

}
