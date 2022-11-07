{

  inputs.packument.url   = "https://registry.npmjs.org/@webassemblyjs/helper-buffer?rev=79-9c5aaaa65caf3376a4c02cae5a73863d";
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
    scope = "@webassemblyjs";
    ident = "@webassemblyjs/helper-buffer";
    ldir  = "info/webassemblyjs/helper-buffer";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
