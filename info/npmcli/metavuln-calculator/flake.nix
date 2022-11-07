{

  inputs.packument.url   = "https://registry.npmjs.org/@npmcli/metavuln-calculator?rev=25-8d3802e6877a7de4c16af14c7e8fa12d";
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
    scope = "@npmcli";
    ident = "@npmcli/metavuln-calculator";
    ldir  = "info/npmcli/metavuln-calculator";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
