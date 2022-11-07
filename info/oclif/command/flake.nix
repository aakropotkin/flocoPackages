{

  inputs.packument.url   = "https://registry.npmjs.org/@oclif/command?rev=112-e5a7317d11741bcfa1102841b2211c63";
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
    scope = "@oclif";
    ident = "@oclif/command";
    ldir  = "info/oclif/command";
    inherit packument fetchInfo;
  } // latest';

}
