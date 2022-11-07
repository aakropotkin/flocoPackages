{

  inputs.packument.url   = "https://registry.npmjs.org/text-table?rev=37-1a51c133d579d35837f960e5fe85edcf";
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
    ident = "text-table";
    ldir  = "info/unscoped/t/text-table";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
