{

  inputs.packument.url   = "https://registry.npmjs.org/@blueprintjs/select?rev=138-c0dda3c5806456e263eeacadbda2fb38";
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
    scope = "@blueprintjs";
    ident = "@blueprintjs/select";
    ldir  = "info/blueprintjs/select";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
